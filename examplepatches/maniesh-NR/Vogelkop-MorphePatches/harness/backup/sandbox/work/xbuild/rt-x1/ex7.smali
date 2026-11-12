.class public abstract Lex7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:F

.field public static final b:F

.field public static final c:F

.field public static final d:F


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lta5;->a:Lta5;

    const/high16 v0, 0x3f800000    # 1.0f

    sput v0, Lex7;->a:F

    sput v0, Lex7;->b:F

    const/high16 v1, 0x40400000    # 3.0f

    sput v1, Lex7;->c:F

    sput v0, Lex7;->d:F

    return-void
.end method
