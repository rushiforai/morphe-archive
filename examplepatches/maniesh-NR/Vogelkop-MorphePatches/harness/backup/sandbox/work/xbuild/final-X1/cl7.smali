.class public abstract Lcl7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll4c;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lf7c;->c:Lf7c;

    new-instance v1, Lsk7;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, Lsk7;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lcl7;->a:Ll4c;

    return-void
.end method
