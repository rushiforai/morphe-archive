.class public final synthetic Ll/vmk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ag60;

.field public final synthetic b:Ll/bej0;


# direct methods
.method public synthetic constructor <init>(Ll/ag60;Ll/bej0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vmk0;->a:Ll/ag60;

    iput-object p2, p0, Ll/vmk0;->b:Ll/bej0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmk0;->a:Ll/ag60;

    iget-object p0, p0, Ll/vmk0;->b:Ll/bej0;

    invoke-static {v0, p0}, Ll/qnk0;->a(Ll/ag60;Ll/bej0;)V

    return-void
.end method
