import app.template.extension.extension.ReplayContextRegistry;

public class ReplayContextRegistryTest {
    public static void main(String[] args){
        ReplayContextRegistry registry=new ReplayContextRegistry(2);
        registry.put("printer1","context","secret1");
        if(!"secret1".equals(registry.get("printer1","context"))||registry.get("printer2","context")!=null)
            throw new AssertionError("credentials must be scoped to the verified printer");
        registry.put("printer2","context","secret2");registry.clear("printer1");
        if(registry.get("printer1","context")!=null||!"secret2".equals(registry.get("printer2","context")))throw new AssertionError("clear must remove only its own contexts");
        registry.put("printer3","context","secret3");registry.put("printer4","context","secret4");
        if(registry.size()!=2)throw new AssertionError("credential memory must remain bounded");
        registry.clearAll();if(registry.size()!=0)throw new AssertionError("clear all must remove every context");
    }
}
