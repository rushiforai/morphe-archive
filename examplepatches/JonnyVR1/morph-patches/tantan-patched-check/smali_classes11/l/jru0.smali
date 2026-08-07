.class public final Ll/jru0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ll/qru0;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    .line 1
    const-string p1, "sendMessageToNativeJs"

    .line 2
    .line 3
    iput-object p1, p0, Ll/jru0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/jru0;->b:Ljava/util/Map;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/jru0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/jru0;->b:Ljava/util/Map;

    .line 6
    .line 7
    invoke-interface {p1, v0, p0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
