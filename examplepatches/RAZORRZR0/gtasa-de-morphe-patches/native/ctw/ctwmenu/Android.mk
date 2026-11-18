LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION := .cpp
LOCAL_MODULE    := ctwmenu
LOCAL_SRC_FILES := main.cpp ../mod/logger.cpp ../mod/config.cpp
LOCAL_CFLAGS += -O2 -DNDEBUG -std=c++17 -Wall -Wno-unused-function
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..
LOCAL_LDLIBS += -llog
include $(BUILD_SHARED_LIBRARY)
