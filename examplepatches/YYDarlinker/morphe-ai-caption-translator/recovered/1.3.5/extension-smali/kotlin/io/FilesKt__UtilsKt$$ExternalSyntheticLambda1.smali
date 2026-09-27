.class public final synthetic Lkotlin/io/FilesKt__UtilsKt$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/IOException;

    invoke-static {p1, p2}, Lkotlin/io/FilesKt__UtilsKt;->$r8$lambda$PN4W4m_bMsOvVN4PKSOdmJGtU3Q(Ljava/io/File;Ljava/io/IOException;)Lkotlin/io/OnErrorAction;

    move-result-object p0

    return-object p0
.end method
