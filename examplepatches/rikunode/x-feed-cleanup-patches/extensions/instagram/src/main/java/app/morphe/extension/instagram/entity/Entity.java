/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.entity;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.lang.reflect.Constructor;

public class Entity {
    protected final Object obj;

    public Entity(Object obj) {
        this.obj = obj;
    }

    public Entity() {
        this.obj = null;
    }

    public Object getObject(){
        return this.obj;
    }

    public Class<?> getObjClass() throws ClassNotFoundException {
        return this.obj.getClass();
    }

    public Entity construct(String className, Class<?>[] paramTypes, Object... params) throws Exception {
        Class<?> clazz = Class.forName(className);
        Constructor<?> constructor = clazz.getDeclaredConstructor(paramTypes);
        constructor.setAccessible(true);
        Object instance = constructor.newInstance(params);
        return new Entity(instance);
    }

    public Object getField(Class cls, Object clsObj, String fieldName) throws Exception {
        // getDeclaredField only searches the exact class, but Instagram declares most of a
        // direct message's fields on its base class, so walk up before giving up.
        NoSuchFieldException notFound = null;
        for (Class<?> c = cls; c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(fieldName);
                field.setAccessible(true);
                return (Object) field.get(clsObj);
            } catch (NoSuchFieldException e) {
                if (notFound == null) notFound = e;
            }
        }
        throw notFound != null ? notFound : new NoSuchFieldException(fieldName);
    }

    public Object getField(Object clsObj, String fieldName) throws Exception {
        return getField(clsObj.getClass(), clsObj, fieldName);
    }

    public Object getField(String fieldName) throws Exception {
        return getField(this.obj, fieldName);
    }

    /**
     * Reads a field from the class that declares it. Instagram subclasses redeclare field names
     * that already exist on their base with a different type, so a lookup by name alone can find
     * the wrong field and silently read null.
     */
    public Object getFieldIn(String declaringClassName, String fieldName) throws Exception {
        Field field = Class.forName(declaringClassName).getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(this.obj);
    }

    public Entity getFieldAsEntityIn(String declaringClassName, String fieldName) throws Exception {
        return new Entity(getFieldIn(declaringClassName, fieldName));
    }

    public Entity getFieldAsEntity(String fieldName) throws Exception {
        Object object = getField(fieldName);
        return new Entity(object);
    }

    public Object getMethod(Object clsObj, String methodName, Class<?>[] paramTypes, Object... params) throws Exception {
        Class<?> clazz;
        if (clsObj instanceof Class<?>) {
            clazz = (Class<?>) clsObj;
        } else {
            clazz = clsObj.getClass();
        }

        Method method = clazz.getDeclaredMethod(methodName, paramTypes);
        method.setAccessible(true);

        return method.invoke(null, params);
    }

    public Object getMethod(Object clsObj, String methodName, Object... params) throws Exception {
        Class<?> clazz;
        if (clsObj instanceof Class<?>) {
            clazz = (Class<?>) clsObj;
        } else {
            clazz = clsObj.getClass();
        }

        if (params == null || params.length == 0) {
            return clazz.getDeclaredMethod(methodName).invoke(clsObj);
        } else {
            Class<?>[] paramTypes = new Class<?>[params.length];
            for (int i = 0; i < params.length; i++) {
                paramTypes[i] = params[i].getClass();
            }
            return this.getMethod(clsObj, methodName, paramTypes, params);
        }

    }

    public Object getMethod(String methodName, Class<?>[] paramTypes, Object... params) throws Exception {
        return this.getMethod(this.obj, methodName, paramTypes, params);
    }

    public Object getMethod(String methodName, Object... params) throws Exception {
        return this.getMethod(this.obj, methodName, params);
    }

}
