.class public final Lbtg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lm54;


# instance fields
.field public final a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    invoke-static {v0}, Lm54;->a([B)Lm54;

    move-result-object v0

    sput-object v0, Lbtg;->b:Lm54;

    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbtg;->a:Ljava/util/HashMap;

    return-void
.end method
