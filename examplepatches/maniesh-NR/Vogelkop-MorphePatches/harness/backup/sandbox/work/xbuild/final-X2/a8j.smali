.class public final synthetic La8j;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final a:La8j;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, La8j;

    const-string v4, "post(Ljava/lang/Object;)V"

    const/4 v5, 0x0

    const/4 v1, 0x1

    const-class v2, Lac8;

    const-string v3, "post"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, La8j;->a:La8j;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
