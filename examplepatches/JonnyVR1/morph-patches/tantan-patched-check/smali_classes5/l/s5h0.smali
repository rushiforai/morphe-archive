.class public final synthetic Ll/s5h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VFrame_FlipContainer;


# direct methods
.method public synthetic constructor <init>(Lv/VFrame_FlipContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s5h0;->a:Lv/VFrame_FlipContainer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5h0;->a:Lv/VFrame_FlipContainer;

    invoke-static {p0}, Ll/z5h0;->f(Lv/VFrame_FlipContainer;)V

    return-void
.end method
