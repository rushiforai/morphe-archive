.class public final synthetic Ll/sw2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uw2;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/uw2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sw2;->a:Ll/uw2;

    iput-boolean p2, p0, Ll/sw2;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sw2;->a:Ll/uw2;

    iget-boolean p0, p0, Ll/sw2;->b:Z

    invoke-static {v0, p0}, Ll/uw2;->x(Ll/uw2;Z)V

    return-void
.end method
