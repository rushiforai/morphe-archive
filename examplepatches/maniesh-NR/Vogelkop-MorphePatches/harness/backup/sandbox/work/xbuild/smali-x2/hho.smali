.class public final synthetic Lhho;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final a:Lhho;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lhho;

    const-string v4, "onBackground()V"

    const/4 v5, 0x0

    const/4 v1, 0x1

    const-class v2, Lxoo;

    const-string v3, "onBackground"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lhho;->a:Lhho;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lxoo;

    invoke-interface {p1}, Lxoo;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
