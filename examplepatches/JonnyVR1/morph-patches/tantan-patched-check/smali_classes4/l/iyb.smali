.class public final synthetic Ll/iyb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/LinkedHashMap;

.field public final synthetic b:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ljava/util/LinkedHashMap;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iyb;->a:Ljava/util/LinkedHashMap;

    iput-object p2, p0, Ll/iyb;->b:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iyb;->a:Ljava/util/LinkedHashMap;

    iget-object p0, p0, Ll/iyb;->b:Ll/qcj;

    invoke-static {v0, p0, p1}, Ll/jyb;->b(Ljava/util/LinkedHashMap;Ll/qcj;Ljava/lang/Object;)V

    return-void
.end method
