.class public final synthetic Ll/x6u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x6u;->a:Ljava/util/List;

    iput-object p2, p0, Ll/x6u;->b:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x6u;->a:Ljava/util/List;

    iget-object p0, p0, Ll/x6u;->b:Ll/qcj;

    invoke-static {v0, p0, p1}, Ll/y6u;->a(Ljava/util/List;Ll/qcj;Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
