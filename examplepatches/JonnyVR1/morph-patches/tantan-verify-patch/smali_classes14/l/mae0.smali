.class public final synthetic Ll/mae0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/scj;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/scj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mae0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/mae0;->b:Ll/scj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mae0;->a:Ljava/util/List;

    iget-object p0, p0, Ll/mae0;->b:Ll/scj;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/nae0;->a(Ljava/util/List;Ll/scj;Ljava/lang/String;)V

    return-void
.end method
