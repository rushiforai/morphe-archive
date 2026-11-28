.class public final Lnicoid/network238/kotlin/Unit;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/Unit;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/Unit;

    invoke-direct {v0}, Lnicoid/network238/kotlin/Unit;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .line 12
    const-string v0, "nicoid.network238.kotlin.Unit"

    return-object v0
.end method
