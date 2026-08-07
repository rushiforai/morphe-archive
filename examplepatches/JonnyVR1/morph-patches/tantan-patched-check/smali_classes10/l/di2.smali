.class public final synthetic Ll/di2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hi2;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/hi2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/di2;->a:Ll/hi2;

    iput-boolean p2, p0, Ll/di2;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di2;->a:Ll/hi2;

    iget-boolean p0, p0, Ll/di2;->b:Z

    invoke-static {v0, p0}, Ll/hi2;->g(Ll/hi2;Z)V

    return-void
.end method
