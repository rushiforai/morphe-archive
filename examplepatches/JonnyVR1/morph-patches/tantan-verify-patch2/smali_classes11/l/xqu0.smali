.class public final Ll/xqu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pks0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/yqu0;


# direct methods
.method public constructor <init>(Ll/yqu0;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p2, "_videoMediaView"

    .line 2
    .line 3
    iput-object p2, p0, Ll/xqu0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Ll/xqu0;->b:Ll/yqu0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final zza()Lorg/json/JSONObject;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final zzb()Lorg/json/JSONObject;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final zzc()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xqu0;->b:Ll/yqu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yqu0;->p8(Ll/yqu0;)Ll/ilu0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xqu0;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/yqu0;->p8(Ll/yqu0;)Ll/ilu0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Ll/ilu0;->m(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
