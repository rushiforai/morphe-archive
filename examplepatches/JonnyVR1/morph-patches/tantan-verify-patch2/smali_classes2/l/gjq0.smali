.class public final synthetic Ll/gjq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/hjq0;

.field public final synthetic b:Ljava/util/UUID;

.field public final synthetic c:Landroidx/work/Data;


# direct methods
.method public synthetic constructor <init>(Ll/hjq0;Ljava/util/UUID;Landroidx/work/Data;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gjq0;->a:Ll/hjq0;

    iput-object p2, p0, Ll/gjq0;->b:Ljava/util/UUID;

    iput-object p3, p0, Ll/gjq0;->c:Landroidx/work/Data;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gjq0;->a:Ll/hjq0;

    iget-object v1, p0, Ll/gjq0;->b:Ljava/util/UUID;

    iget-object p0, p0, Ll/gjq0;->c:Landroidx/work/Data;

    invoke-static {v0, v1, p0}, Ll/hjq0;->b(Ll/hjq0;Ljava/util/UUID;Landroidx/work/Data;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
