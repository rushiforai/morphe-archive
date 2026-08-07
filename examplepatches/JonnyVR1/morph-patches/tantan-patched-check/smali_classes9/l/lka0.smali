.class public final synthetic Ll/lka0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/cla0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/cla0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lka0;->a:Ll/cla0;

    iput-boolean p2, p0, Ll/lka0;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lka0;->a:Ll/cla0;

    iget-boolean p0, p0, Ll/lka0;->b:Z

    invoke-static {v0, p0}, Ll/cla0;->q0(Ll/cla0;Z)V

    return-void
.end method
