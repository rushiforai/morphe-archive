.class public final synthetic Ll/pcl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;

.field public final synthetic c:Ll/tcl0;

.field public final synthetic d:Lkotlin/jvm/functions/Function1;

.field public final synthetic e:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Ll/tcl0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pcl0;->a:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Ll/pcl0;->b:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Ll/pcl0;->c:Ll/tcl0;

    iput-object p4, p0, Ll/pcl0;->d:Lkotlin/jvm/functions/Function1;

    iput-object p5, p0, Ll/pcl0;->e:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pcl0;->a:Lkotlin/jvm/functions/Function0;

    iget-object v1, p0, Ll/pcl0;->b:Lkotlin/jvm/functions/Function1;

    iget-object v2, p0, Ll/pcl0;->c:Ll/tcl0;

    iget-object v3, p0, Ll/pcl0;->d:Lkotlin/jvm/functions/Function1;

    iget-object v4, p0, Ll/pcl0;->e:Lkotlin/jvm/functions/Function0;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/tcl0;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Ll/tcl0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Ljava/lang/Throwable;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
