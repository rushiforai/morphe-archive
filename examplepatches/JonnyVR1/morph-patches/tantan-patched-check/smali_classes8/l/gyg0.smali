.class public final synthetic Ll/gyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/yug0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILl/yug0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/gyg0;->a:I

    iput-object p2, p0, Ll/gyg0;->b:Ll/yug0;

    iput-object p3, p0, Ll/gyg0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Ll/gyg0;->a:I

    iget-object v1, p0, Ll/gyg0;->b:Ll/yug0;

    iget-object p0, p0, Ll/gyg0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/uyg0;->i(ILl/yug0;Ljava/lang/String;)V

    return-void
.end method
