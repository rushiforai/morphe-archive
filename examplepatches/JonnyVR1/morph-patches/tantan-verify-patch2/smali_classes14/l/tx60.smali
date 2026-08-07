.class public final synthetic Ll/tx60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/oy60;


# direct methods
.method public synthetic constructor <init>(Ll/oy60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tx60;->a:Ll/oy60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx60;->a:Ll/oy60;

    check-cast p1, Lcom/google/android/gms/auth/api/credentials/Credential;

    invoke-static {p0, p1}, Ll/oy60;->h1(Ll/oy60;Lcom/google/android/gms/auth/api/credentials/Credential;)V

    return-void
.end method
