/*
 * libytvshim.so - answers some system property reads of YouTube TV's native engine
 * (libchrobalt.so) with other values, so YouTube treats the TV as a supported device.
 *
 * The "Spoof device" patch renames, inside libchrobalt.so:
 *   - the dependency libandroid.so            -> libytvshim.so (this library; it depends on libandroid.so)
 *   - __system_property_get                   -> ytvshim_property_get_
 *   - __system_property_find                  -> ytvshim_property_find_
 *   - __system_property_read_callback         -> ytvshim_property_read_callback_
 *
 * Values come from environment variables set by the Java extension before the engine starts
 * (YTV_BRAND, YTV_MODEL, YTV_MANUFACTURER, YTV_CHIPSET). Unset or empty: the real value is used.
 *
 * Licensed under GPLv3, see the NOTICE file.
 */
#include <dlfcn.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/system_properties.h>

#define EXPORT __attribute__((visibility("default")))

static const char *const NAMES[] = {
    "ro.product.brand", "ro.product.model", "ro.product.manufacturer", "ro.board.platform",
};
static const char *const ENVS[] = {
    "YTV_BRAND", "YTV_MODEL", "YTV_MANUFACTURER", "YTV_CHIPSET",
};
#define COUNT 4

/* Fake prop_info handles: addresses inside this array. */
static char markers[COUNT];

static const char *override_value(const char *name, int *index) {
    if (name == NULL) return NULL;
    for (int i = 0; i < COUNT; i++) {
        if (strcmp(name, NAMES[i]) == 0) {
            const char *value = getenv(ENVS[i]);
            if (value != NULL && value[0] != '\0') {
                if (index) *index = i;
                return value;
            }
            return NULL;
        }
    }
    return NULL;
}

EXPORT int ytvshim_property_get_(const char *name, char *value) {
    const char *fake = override_value(name, NULL);
    if (fake != NULL) {
        strncpy(value, fake, PROP_VALUE_MAX - 1);
        value[PROP_VALUE_MAX - 1] = '\0';
        return (int) strlen(value);
    }
    return __system_property_get(name, value);
}

EXPORT const prop_info *ytvshim_property_find_(const char *name) {
    int index;
    if (override_value(name, &index) != NULL) return (const prop_info *) &markers[index];
    return __system_property_find(name);
}

EXPORT void ytvshim_property_read_callback_(
        const prop_info *pi,
        void (*callback)(void *cookie, const char *name, const char *value, uint32_t serial),
        void *cookie) {
    const char *p = (const char *) pi;
    if (p >= markers && p < markers + COUNT) {
        int i = (int) (p - markers);
        const char *value = getenv(ENVS[i]);
        callback(cookie, NAMES[i], value != NULL ? value : "", 0);
        return;
    }
    /* Declared only from API 26 on (minSdk here is 24), so resolve it at run time. */
    static void (*real)(const prop_info *, void (*)(void *, const char *, const char *, uint32_t), void *);
    if (real == NULL) {
        *(void **) &real = dlsym(RTLD_DEFAULT, "__system_property_read_callback");
        if (real == NULL) return;
    }
    real(pi, callback, cookie);
}
