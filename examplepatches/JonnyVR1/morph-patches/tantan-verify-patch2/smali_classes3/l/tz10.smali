.class public final synthetic Ll/tz10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xz10;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/xz10;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tz10;->a:Ll/xz10;

    iput p2, p0, Ll/tz10;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tz10;->a:Ll/xz10;

    iget p0, p0, Ll/tz10;->b:I

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    invoke-static {v0, p0, p1}, Ll/xz10;->b1(Ll/xz10;ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
