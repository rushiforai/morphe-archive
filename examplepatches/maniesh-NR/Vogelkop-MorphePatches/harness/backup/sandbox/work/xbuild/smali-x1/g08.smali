.class public final Lg08;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf99;


# static fields
.field public static final a:Lg08;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lg08;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lg08;->a:Lg08;

    return-void
.end method


# virtual methods
.method public final collect(Ll99;Lmt5;)Ljava/lang/Object;
    .registers 3

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
