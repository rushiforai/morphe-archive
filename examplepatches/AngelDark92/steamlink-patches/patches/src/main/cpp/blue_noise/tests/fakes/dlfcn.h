#pragma once
#define RTLD_NOW 2
#define RTLD_LOCAL 0
extern "C" void* dlopen(const char*, int);
extern "C" void* dlsym(void*, const char*);
typedef struct {
    const char* dli_fname;
    void* dli_fbase;
    const char* dli_sname;
    void* dli_saddr;
} Dl_info;
extern "C" int dladdr(const void*, Dl_info*);
