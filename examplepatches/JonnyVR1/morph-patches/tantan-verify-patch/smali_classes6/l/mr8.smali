.class public final synthetic Ll/mr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ms8;

.field public final synthetic b:Ljava/lang/Throwable;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ms8;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mr8;->a:Ll/ms8;

    iput-object p2, p0, Ll/mr8;->b:Ljava/lang/Throwable;

    iput-object p3, p0, Ll/mr8;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mr8;->a:Ll/ms8;

    iget-object v1, p0, Ll/mr8;->b:Ljava/lang/Throwable;

    iget-object p0, p0, Ll/mr8;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/ms8;->t0(Ll/ms8;Ljava/lang/Throwable;Ljava/lang/String;)V

    return-void
.end method
