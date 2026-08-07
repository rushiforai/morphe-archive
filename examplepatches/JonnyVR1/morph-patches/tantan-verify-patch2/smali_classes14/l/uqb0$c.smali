.class public Ll/uqb0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uqb0;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uqb0;


# direct methods
.method public constructor <init>(Ll/uqb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uqb0$c;->a:Ll/uqb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public replaceSource(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object p0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
