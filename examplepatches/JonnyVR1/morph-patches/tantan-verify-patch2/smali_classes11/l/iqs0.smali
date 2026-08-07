.class public final Ll/iqs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/har0;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/mqs0;


# direct methods
.method public constructor <init>(Ll/mqs0;Ll/har0;Ljava/util/Map;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/iqs0;->a:Ll/har0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/iqs0;->b:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p4, p0, Ll/iqs0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/iqs0;->d:Ll/mqs0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p0, "OpenGmsgHandler.attributionReportingManager"

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/iqs0;->a:Ll/har0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/iqs0;->b:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v2, p0, Ll/iqs0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/iqs0;->d:Ll/mqs0;

    .line 10
    .line 11
    invoke-static {p0, p1, v0, v1, v2}, Ll/mqs0;->e(Ll/mqs0;Ljava/lang/String;Ll/har0;Ljava/util/Map;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
