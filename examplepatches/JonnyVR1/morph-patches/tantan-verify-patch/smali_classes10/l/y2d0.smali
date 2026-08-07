.class public final synthetic Ll/y2d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/z2d0;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ll/z2d0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y2d0;->a:Ll/z2d0;

    iput-object p2, p0, Ll/y2d0;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y2d0;->a:Ll/z2d0;

    iget-object p0, p0, Ll/y2d0;->b:Ljava/lang/Object;

    invoke-static {v0, p0}, Ll/z2d0;->b(Ll/z2d0;Ljava/lang/Object;)V

    return-void
.end method
