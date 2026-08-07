.class public final synthetic Ll/q8x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/v8x;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/v8x;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8x;->a:Ll/v8x;

    iput-object p2, p0, Ll/q8x;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/q8x;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q8x;->a:Ll/v8x;

    iget-object v1, p0, Ll/q8x;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/q8x;->c:Z

    invoke-static {v0, v1, p0}, Ll/v8x;->D0(Ll/v8x;Ljava/lang/String;Z)V

    return-void
.end method
