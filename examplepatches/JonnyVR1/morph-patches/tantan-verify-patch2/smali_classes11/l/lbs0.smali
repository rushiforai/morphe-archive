.class public final synthetic Ll/lbs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/lbs0;->a:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean p0, p0, Ll/lbs0;->a:Z

    .line 2
    .line 3
    check-cast p1, Ll/f5u0;

    .line 4
    .line 5
    check-cast p2, Ll/sni0;

    .line 6
    .line 7
    sget-object v0, Ll/vrs0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Ll/f5u0;->c(ZLl/sni0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
