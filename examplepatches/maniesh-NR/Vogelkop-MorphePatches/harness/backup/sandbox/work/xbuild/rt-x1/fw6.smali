.class public final Lfw6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmf1;


# static fields
.field public static final a:Lfw6;

.field public static final b:Lw89;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lfw6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfw6;->a:Lfw6;

    new-instance v0, Lw89;

    const/high16 v1, 0x3f800000    # 1.0f

    const v2, 0x44bb8000    # 1500.0f

    invoke-direct {v0, v1, v2}, Lw89;-><init>(FF)V

    sput-object v0, Lfw6;->b:Lw89;

    return-void
.end method


# virtual methods
.method public final get(I)Ln89;
    .registers 2

    sget-object p0, Lfw6;->b:Lw89;

    return-object p0
.end method
