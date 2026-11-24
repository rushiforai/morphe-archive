#![no_std]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]
#![allow(non_upper_case_globals)]
#![allow(deref_nullptr)]
include!(concat!(env!("OUT_DIR"), "/bindings.rs"));

// Pillow's libjpeg decoder ignores nonfatal warnings. TurboJPEG reports them
// as failures even after finishing the image; retain fatal errors and respect
// STOPONWARNING, where the output may not have been completed.
unsafe fn pillow_status(handle: tjhandle, status: libc::c_int) -> libc::c_int {
    if status != 0
        // SAFETY: callers uphold the same valid-handle contract as libjpeg.
        && unsafe { tj3GetErrorCode(handle) } == TJERR_TJERR_WARNING as libc::c_int
        && unsafe { tj3Get(handle, TJPARAM_TJPARAM_STOPONWARNING as libc::c_int) } == 0
    {
        0
    } else {
        status
    }
}

/// Read a JPEG header with Pillow-compatible nonfatal-warning handling.
///
/// # Safety
/// The handle and source pointer/length must satisfy `tj3DecompressHeader`.
pub unsafe extern "C" fn tj3DecompressHeader(
    handle: tjhandle,
    jpegBuf: *const libc::c_uchar,
    jpegSize: size_t,
) -> libc::c_int {
    // SAFETY: this wrapper preserves the underlying API's caller obligations.
    let status = unsafe { native_tj3DecompressHeader(handle, jpegBuf, jpegSize) };
    unsafe { pillow_status(handle, status) }
}

/// Decode 8-bit JPEG pixels with Pillow-compatible nonfatal-warning handling.
///
/// # Safety
/// Handle, pointers, lengths, pitch and pixel format must satisfy `tj3Decompress8`.
pub unsafe extern "C" fn tj3Decompress8(
    handle: tjhandle,
    jpegBuf: *const libc::c_uchar,
    jpegSize: size_t,
    dstBuf: *mut libc::c_uchar,
    pitch: libc::c_int,
    pixelFormat: libc::c_int,
) -> libc::c_int {
    // SAFETY: this wrapper preserves the underlying API's caller obligations.
    let status =
        unsafe { native_tj3Decompress8(handle, jpegBuf, jpegSize, dstBuf, pitch, pixelFormat) };
    unsafe { pillow_status(handle, status) }
}
