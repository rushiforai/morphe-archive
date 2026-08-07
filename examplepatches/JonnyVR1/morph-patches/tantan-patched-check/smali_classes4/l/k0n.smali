.class public final synthetic Ll/k0n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zzm;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/zzm;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0n;->a:Ll/zzm;

    iput-boolean p2, p0, Ll/k0n;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k0n;->a:Ll/zzm;

    iget-boolean p0, p0, Ll/k0n;->b:Z

    invoke-static {v0, p0}, Ll/l0n;->o(Ll/zzm;Z)V

    return-void
.end method
