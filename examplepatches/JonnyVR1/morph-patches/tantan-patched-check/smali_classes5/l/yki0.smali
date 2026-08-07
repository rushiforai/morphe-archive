.class public final synthetic Ll/yki0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(ZLandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/yki0;->a:Z

    iput-object p2, p0, Ll/yki0;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yki0;->a:Z

    iget-object p0, p0, Ll/yki0;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Ll/zki0;->o(ZLandroid/content/Context;)V

    return-void
.end method
