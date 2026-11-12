.class public final Lld4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lbf2;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    invoke-static {v0}, Lc26;->j(I)Lbf2;

    move-result-object v0

    sput-object v0, Lld4;->b:Lbf2;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lld4;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lld4;->a:Ljava/lang/String;

    return-object p0
.end method
