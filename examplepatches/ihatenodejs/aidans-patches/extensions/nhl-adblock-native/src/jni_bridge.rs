use jni::objects::{JClass, JObjectArray, JString};
use jni::sys::{jint, jlong, jstring};
use jni::JNIEnv;
use std::collections::HashMap;
use std::sync::atomic::{AtomicI64, Ordering};
use std::sync::LazyLock;
use std::sync::{Arc, RwLock};

use crate::engine_wrapper::EngineWrapper;
use crate::preprocessor::preprocess_list;

static REGISTRY: LazyLock<RwLock<HashMap<i64, Arc<EngineWrapper>>>> =
    LazyLock::new(|| RwLock::new(HashMap::new()));
static NEXT_HANDLE: AtomicI64 = AtomicI64::new(1);

fn throw_java_exception(env: &mut JNIEnv, msg: &str) {
    let _ = env.throw_new("java/lang/IllegalStateException", msg);
}

#[no_mangle]
pub extern "system" fn Java_app_aidan_extension_nhl_adblock_NativeEngine_compile(
    mut env: JNIEnv,
    _class: JClass,
    list_paths_obj: JObjectArray,
    cache_path_obj: JString,
) -> jlong {
    let len = match env.get_array_length(&list_paths_obj) {
        Ok(l) => l as usize,
        Err(e) => {
            throw_java_exception(&mut env, &format!("Invalid list paths array: {}", e));
            return 0;
        }
    };

    let mut paths = Vec::with_capacity(len);
    for i in 0..len {
        let elem = match env.get_object_array_element(&list_paths_obj, i as i32) {
            Ok(e) => JString::from(e),
            Err(e) => {
                throw_java_exception(
                    &mut env,
                    &format!("Failed to get path at index {}: {}", i, e),
                );
                return 0;
            }
        };
        let path_str: String = match env.get_string(&elem) {
            Ok(s) => s.into(),
            Err(e) => {
                throw_java_exception(&mut env, &format!("Failed to parse path string: {}", e));
                return 0;
            }
        };
        paths.push(path_str);
        let _ = env.delete_local_ref(elem);
    }

    let cache_path: Option<String> = if !cache_path_obj.is_null() {
        env.get_string(&cache_path_obj).ok().map(|s| s.into())
    } else {
        None
    };

    match EngineWrapper::compile(&paths, cache_path.as_deref()) {
        Ok(wrapper) => {
            let handle = NEXT_HANDLE.fetch_add(1, Ordering::SeqCst);
            let mut reg = REGISTRY.write().unwrap();
            reg.insert(handle, Arc::new(wrapper));
            handle
        }
        Err(e) => {
            throw_java_exception(&mut env, &format!("Failed to compile engine: {}", e));
            0
        }
    }
}

#[no_mangle]
pub extern "system" fn Java_app_aidan_extension_nhl_adblock_NativeEngine_match(
    mut env: JNIEnv,
    _class: JClass,
    handle: jlong,
    request_url_obj: JString,
    document_url_obj: JString,
    resource_type_obj: JString,
    method_obj: JString,
) -> jint {
    let engine = {
        let reg = REGISTRY.read().unwrap();
        match reg.get(&handle) {
            Some(e) => Arc::clone(e),
            None => {
                throw_java_exception(&mut env, &format!("Invalid engine handle: {}", handle));
                return 0;
            }
        }
    };

    let req_url: String = match env.get_string(&request_url_obj) {
        Ok(s) => s.into(),
        Err(_) => return 0,
    };
    let doc_url: String = match env.get_string(&document_url_obj) {
        Ok(s) => s.into(),
        Err(_) => return 0,
    };
    let res_type: String = match env.get_string(&resource_type_obj) {
        Ok(s) => s.into(),
        Err(_) => "other".to_string(),
    };
    let method: String = match env.get_string(&method_obj) {
        Ok(s) => s.into(),
        Err(_) => "GET".to_string(),
    };

    engine.match_request(&req_url, &doc_url, &res_type, &method)
}

#[no_mangle]
pub extern "system" fn Java_app_aidan_extension_nhl_adblock_NativeEngine_cosmetics(
    mut env: JNIEnv,
    _class: JClass,
    handle: jlong,
    document_url_obj: JString,
) -> jstring {
    let engine = {
        let reg = REGISTRY.read().unwrap();
        match reg.get(&handle) {
            Some(e) => Arc::clone(e),
            None => {
                throw_java_exception(&mut env, &format!("Invalid engine handle: {}", handle));
                return std::ptr::null_mut();
            }
        }
    };

    let doc_url: String = match env.get_string(&document_url_obj) {
        Ok(s) => s.into(),
        Err(_) => return std::ptr::null_mut(),
    };

    match engine.cosmetics(&doc_url) {
        Ok(json) => match env.new_string(json) {
            Ok(js) => js.into_raw(),
            Err(_) => std::ptr::null_mut(),
        },
        Err(e) => {
            throw_java_exception(&mut env, &format!("Cosmetics error: {}", e));
            std::ptr::null_mut()
        }
    }
}

#[no_mangle]
pub extern "system" fn Java_app_aidan_extension_nhl_adblock_NativeEngine_genericSelectors(
    mut env: JNIEnv,
    _class: JClass,
    handle: jlong,
    document_url_obj: JString,
    classes_obj: JObjectArray,
    ids_obj: JObjectArray,
) -> jstring {
    let engine = {
        let reg = REGISTRY.read().unwrap();
        match reg.get(&handle) {
            Some(e) => Arc::clone(e),
            None => {
                throw_java_exception(&mut env, &format!("Invalid engine handle: {}", handle));
                return std::ptr::null_mut();
            }
        }
    };

    let doc_url: String = match env.get_string(&document_url_obj) {
        Ok(s) => s.into(),
        Err(_) => return std::ptr::null_mut(),
    };

    let classes_len = env.get_array_length(&classes_obj).unwrap_or(0) as usize;
    let mut classes = Vec::with_capacity(classes_len.min(256));
    for i in 0..classes_len.min(256) {
        if let Ok(elem) = env.get_object_array_element(&classes_obj, i as i32) {
            let elem_str = JString::from(elem);
            if let Ok(st) = env.get_string(&elem_str).map(|s| -> String { s.into() }) {
                if st.len() <= 256 {
                    classes.push(st);
                }
            }
            let _ = env.delete_local_ref(elem_str);
        }
    }

    let ids_len = env.get_array_length(&ids_obj).unwrap_or(0) as usize;
    let mut ids = Vec::with_capacity(ids_len.min(256));
    for i in 0..ids_len.min(256) {
        if let Ok(elem) = env.get_object_array_element(&ids_obj, i as i32) {
            let elem_str = JString::from(elem);
            if let Ok(st) = env.get_string(&elem_str).map(|s| -> String { s.into() }) {
                if st.len() <= 256 {
                    ids.push(st);
                }
            }
            let _ = env.delete_local_ref(elem_str);
        }
    }

    match engine.generic_selectors(&doc_url, &classes, &ids) {
        Ok(json) => match env.new_string(json) {
            Ok(js) => js.into_raw(),
            Err(_) => std::ptr::null_mut(),
        },
        Err(e) => {
            throw_java_exception(&mut env, &format!("Generic selectors error: {}", e));
            std::ptr::null_mut()
        }
    }
}

#[no_mangle]
pub extern "system" fn Java_app_aidan_extension_nhl_adblock_NativeEngine_release(
    _env: JNIEnv,
    _class: JClass,
    handle: jlong,
) {
    let mut reg = REGISTRY.write().unwrap();
    reg.remove(&handle);
}

#[no_mangle]
pub extern "system" fn Java_app_aidan_extension_nhl_adblock_NativeEngine_parseDiagnostics(
    mut env: JNIEnv,
    _class: JClass,
    content_obj: JString,
) -> jstring {
    let content: String = match env.get_string(&content_obj) {
        Ok(s) => s.into(),
        Err(_) => return std::ptr::null_mut(),
    };

    let (_, diag) = match preprocess_list(&content) {
        Ok(res) => res,
        Err(e) => {
            throw_java_exception(&mut env, &format!("Preprocess error: {}", e));
            return std::ptr::null_mut();
        }
    };

    match serde_json::to_string(&diag) {
        Ok(json) => match env.new_string(json) {
            Ok(js) => js.into_raw(),
            Err(_) => std::ptr::null_mut(),
        },
        Err(_) => std::ptr::null_mut(),
    }
}
