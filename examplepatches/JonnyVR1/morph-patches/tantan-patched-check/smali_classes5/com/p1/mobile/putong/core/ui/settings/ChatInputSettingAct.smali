.class public Lcom/p1/mobile/putong/core/ui/settings/ChatInputSettingAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public X1()Ll/ar2;
    .locals 1

    .line 1
    new-instance v0, Ll/ow4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ow4;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Y1()Ll/iam;
    .locals 1

    .line 1
    new-instance v0, Ll/rw4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rw4;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_chat_keyboard_setting"

    .line 2
    .line 3
    return-object p0
.end method
