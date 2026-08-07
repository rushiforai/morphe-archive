.class public Ll/kho0$a;
.super Ll/eas;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kho0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kho0;


# direct methods
.method public constructor <init>(Ll/kho0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kho0$a;->a:Ll/kho0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "[live]voicePlayer"

    .line 5
    .line 6
    const-string p2, "stop player when rtc connect"

    .line 7
    .line 8
    invoke-static {p1, p2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/kho0$a;->a:Ll/kho0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/kho0;->M3(Ll/kho0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
