.class public final synthetic Ll/vfb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lkotlin/Pair;

.field public final synthetic b:Ll/yfb0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/Pair;Ll/yfb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vfb0;->a:Lkotlin/Pair;

    iput-object p2, p0, Ll/vfb0;->b:Ll/yfb0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vfb0;->a:Lkotlin/Pair;

    iget-object p0, p0, Ll/vfb0;->b:Ll/yfb0;

    invoke-static {v0, p0}, Ll/yfb0;->W(Lkotlin/Pair;Ll/yfb0;)V

    return-void
.end method
