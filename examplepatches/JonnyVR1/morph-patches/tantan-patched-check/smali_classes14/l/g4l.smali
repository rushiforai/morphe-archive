.class public final synthetic Ll/g4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/o4l;


# direct methods
.method public synthetic constructor <init>(Ll/o4l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g4l;->a:Ll/o4l;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4l;->a:Ll/o4l;

    invoke-static {p0}, Ll/o4l;->b(Ll/o4l;)Lv/VSwitchButton;

    move-result-object p0

    return-object p0
.end method
