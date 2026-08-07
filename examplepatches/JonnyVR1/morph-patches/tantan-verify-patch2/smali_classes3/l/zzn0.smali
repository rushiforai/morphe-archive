.class public final synthetic Ll/zzn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e0o0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ll/e0o0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zzn0;->a:Ll/e0o0;

    iput-object p2, p0, Ll/zzn0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/zzn0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/zzn0;->d:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zzn0;->a:Ll/e0o0;

    iget-object v1, p0, Ll/zzn0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/zzn0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/zzn0;->d:Ll/nsv;

    invoke-static {v0, v1, v2, p0}, Ll/e0o0;->k(Ll/e0o0;Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V

    return-void
.end method
