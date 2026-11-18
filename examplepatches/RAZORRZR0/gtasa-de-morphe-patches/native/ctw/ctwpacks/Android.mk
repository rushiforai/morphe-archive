LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION := .cpp
LOCAL_MODULE    := ctwpacks
LOCAL_SRC_FILES := main.cpp radio.cpp ../mod/logger.cpp ../mod/config.cpp
LOCAL_CFLAGS += -O2 -DNDEBUG -std=c++17 -Wall -Wno-unused-function
LOCAL_C_INCLUDES += $(LOCAL_PATH)/.. $(LOCAL_PATH)/codecs/include
# Radio converter codecs (build_codecs.sh): static, and only their symbols the converter uses are kept.
LOCAL_LDFLAGS += -L$(LOCAL_PATH)/codecs/lib -Wl,--gc-sections -Wl,--exclude-libs,ALL
LOCAL_LDLIBS += -lavcodec -lavutil -lmp3lame -lm -llog
include $(BUILD_SHARED_LIBRARY)
