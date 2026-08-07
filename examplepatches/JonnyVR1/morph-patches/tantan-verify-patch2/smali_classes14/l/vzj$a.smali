.class public Ll/vzj$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vzj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gk2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/vzj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzj$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/vzj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzj$a;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/vzj$a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzj$a;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/vzj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzj$a;->d:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public e()Ll/vzj;
    .locals 1

    .line 1
    new-instance v0, Ll/vzj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vzj;-><init>(Ll/vzj$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ll/vzj$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vzj$a;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    return-object p0
.end method
