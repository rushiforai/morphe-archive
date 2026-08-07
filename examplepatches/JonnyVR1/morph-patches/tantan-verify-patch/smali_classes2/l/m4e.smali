.class public final synthetic Ll/m4e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/o4e;

.field public final synthetic b:Ll/o4e$a;


# direct methods
.method public synthetic constructor <init>(Ll/o4e;Ll/o4e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m4e;->a:Ll/o4e;

    iput-object p2, p0, Ll/m4e;->b:Ll/o4e$a;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m4e;->a:Ll/o4e;

    iget-object p0, p0, Ll/m4e;->b:Ll/o4e$a;

    invoke-static {v0, p0}, Ll/o4e$a;->k(Ll/o4e;Ll/o4e$a;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method
