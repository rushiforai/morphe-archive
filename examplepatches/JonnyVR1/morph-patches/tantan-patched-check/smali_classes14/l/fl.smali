.class public final synthetic Ll/fl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function4;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fl;->a:Ll/y20;

    iput-object p2, p0, Ll/fl;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fl;->a:Ll/y20;

    iget-object v1, p0, Ll/fl;->b:Lcom/p1/mobile/android/app/Act;

    move-object v2, p1

    check-cast v2, Ljava/lang/Integer;

    move-object v3, p2

    check-cast v3, Ljava/lang/Integer;

    move-object v4, p3

    check-cast v4, Ljava/lang/Integer;

    move-object v5, p4

    check-cast v5, Ljava/util/Date;

    invoke-static/range {v0 .. v5}, Ll/sm;->Y(Ll/y20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Date;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
