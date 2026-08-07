.class public final synthetic Ll/fyo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kyo0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/kyo0;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fyo0;->a:Ll/kyo0;

    iput-object p2, p0, Ll/fyo0;->b:Ljava/lang/String;

    iput p3, p0, Ll/fyo0;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fyo0;->a:Ll/kyo0;

    iget-object v1, p0, Ll/fyo0;->b:Ljava/lang/String;

    iget p0, p0, Ll/fyo0;->c:I

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/kyo0;->X3(Ll/kyo0;Ljava/lang/String;ILjava/util/List;)V

    return-void
.end method
