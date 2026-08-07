.class public final synthetic Ll/iy60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/auth/api/credentials/Credential;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/auth/api/credentials/Credential;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iy60;->a:Lcom/google/android/gms/auth/api/credentials/Credential;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iy60;->a:Lcom/google/android/gms/auth/api/credentials/Credential;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/oy60;->U0(Lcom/google/android/gms/auth/api/credentials/Credential;Ljava/lang/String;)V

    return-void
.end method
