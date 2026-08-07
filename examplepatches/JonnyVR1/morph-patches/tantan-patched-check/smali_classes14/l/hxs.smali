.class public final synthetic Ll/hxs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/kxs;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/kxs;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hxs;->a:Ll/kxs;

    iput-boolean p2, p0, Ll/hxs;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hxs;->a:Ll/kxs;

    iget-boolean p0, p0, Ll/hxs;->b:Z

    invoke-static {v0, p0}, Ll/kxs;->d(Ll/kxs;Z)V

    return-void
.end method
