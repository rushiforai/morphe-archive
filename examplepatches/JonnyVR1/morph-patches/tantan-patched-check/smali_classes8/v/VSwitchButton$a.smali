.class public final Lv/VSwitchButton$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VSwitchButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lv/VSwitchButton;


# direct methods
.method public constructor <init>(Lv/VSwitchButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSwitchButton$a;->a:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lv/VSwitchButton;Ll/uzk0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lv/VSwitchButton$a;-><init>(Lv/VSwitchButton;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lv/VSwitchButton$a;->a:Lv/VSwitchButton;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setPressed(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
