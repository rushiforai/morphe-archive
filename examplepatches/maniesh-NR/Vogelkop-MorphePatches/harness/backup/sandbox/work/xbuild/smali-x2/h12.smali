.class public final synthetic Lh12;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# static fields
.field public static final a:Lh12;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lh12;

    const-string v4, "getAriaUserImagesDir()Ljava/lang/String;"

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-class v2, Lcom/opera/android/utilities/OperaPathUtils;

    const-string v3, "getAriaUserImagesDir"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lh12;->a:Lh12;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lsnf;->c:Ljava/lang/String;

    return-object p0
.end method
