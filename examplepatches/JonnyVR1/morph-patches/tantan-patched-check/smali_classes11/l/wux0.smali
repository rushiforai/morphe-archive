.class public final synthetic Ll/wux0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/iux0;

.field public synthetic b:Lcom/google/android/gms/measurement/internal/zzo;


# direct methods
.method public synthetic constructor <init>(Ll/iux0;Lcom/google/android/gms/measurement/internal/zzo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wux0;->a:Ll/iux0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wux0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wux0;->a:Ll/iux0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wux0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/iux0;->r8(Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
