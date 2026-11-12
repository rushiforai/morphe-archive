.class public abstract Ladp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkotlin/text/Regex;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "/v(\\d+)\\.(\\d+)\\.(\\d+)(?:-[a-zA-Z0-9._-]+)?/"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Ladp;->a:Lkotlin/text/Regex;

    return-void
.end method
