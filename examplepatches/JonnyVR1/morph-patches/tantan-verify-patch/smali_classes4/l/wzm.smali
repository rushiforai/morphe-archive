.class public final synthetic Ll/wzm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/zzm;

.field public final synthetic b:Ll/v0t;


# direct methods
.method public synthetic constructor <init>(Ll/zzm;Ll/v0t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wzm;->a:Ll/zzm;

    iput-object p2, p0, Ll/wzm;->b:Ll/v0t;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzm;->a:Ll/zzm;

    iget-object p0, p0, Ll/wzm;->b:Ll/v0t;

    invoke-static {v0, p0}, Ll/zzm;->H(Ll/zzm;Ll/v0t;)V

    return-void
.end method
