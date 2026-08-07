.class public final synthetic Ll/xsd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/atd$h$a;


# instance fields
.field public final synthetic a:Ll/atd$d;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/atd$d;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xsd;->a:Ll/atd$d;

    iput-object p2, p0, Ll/xsd;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(ILl/dfj0;[I)Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xsd;->a:Ll/atd$d;

    iget-object p0, p0, Ll/xsd;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Ll/atd;->v(Ll/atd$d;Ljava/lang/String;ILl/dfj0;[I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
