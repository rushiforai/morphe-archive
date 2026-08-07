.class public Ll/q16$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tp80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q16;->t(Ljava/util/HashSet;Ljava/util/HashSet;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/tp80<",
        "Lcom/p1/mobile/putong/data/Contact;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/HashSet;

.field public final synthetic b:Ll/q16;


# direct methods
.method public constructor <init>(Ll/q16;Ljava/util/HashSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q16$a;->b:Ll/q16;

    .line 2
    .line 3
    iput-object p2, p0, Ll/q16$a;->a:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Contact;)Z
    .locals 3

    .line 1
    iget-object p0, p0, Ll/q16$a;->a:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/data/Contact;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 30
    .line 31
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Contact;->thumbnailUri:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Contact;->thumbnailUri:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Contact;->source:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Contact;->source:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return p0

    .line 61
    :cond_1
    const/4 p0, 0x1

    .line 62
    return p0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Contact;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q16$a;->a(Lcom/p1/mobile/putong/data/Contact;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
